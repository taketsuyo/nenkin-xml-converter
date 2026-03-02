#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
XSL_DIR="$SCRIPT_DIR/RenkiStylesheet"
OUTPUT="$SCRIPT_DIR/届出単位変換ツール.html"

if [ ! -d "$XSL_DIR" ]; then
  echo "エラー: RenkiStylesheet フォルダが見つかりません"
  exit 1
fi

echo "XSLファイルをBase64エンコード中..."
XSL_DATA="{"
FIRST=true
for xsl_file in "$XSL_DIR"/*.xsl; do
  basename=$(basename "$xsl_file" .xsl)
  b64=$(base64 < "$xsl_file" | tr -d '\n')
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    XSL_DATA+=","
  fi
  XSL_DATA+="\"$basename\":\"$b64\""
done
XSL_DATA+="}"

echo "HTMLファイルを生成中..."
cat > "$OUTPUT" << 'HTMLSTART'
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>届出単位変換ツール（年金機構 電子通知書）</title>
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:"Yu Gothic","Hiragino Sans","Meiryo",sans-serif;padding:20px;background:#f0f4f8;color:#333;line-height:1.7}
    .container{max-width:920px;margin:0 auto;background:#fff;border-radius:12px;box-shadow:0 4px 20px rgba(0,0,0,.08);overflow:hidden}
    header{background:linear-gradient(135deg,#1a5f7a 0%,#159895 100%);color:#fff;padding:28px 36px}
    header h1{font-size:1.5rem;font-weight:600}
    header p{margin-top:10px;font-size:.95rem;opacity:.95}
    .main{padding:36px}
    .guide-box{background:#eef7fa;border:1px solid #b8dce8;border-radius:10px;padding:22px 28px;margin-bottom:32px}
    .guide-box h3{font-size:1.05rem;color:#1a5f7a;margin-bottom:14px}
    .guide-box ol{padding-left:22px}
    .guide-box li{margin-bottom:8px;font-size:.95rem}
    .step-section{margin-bottom:32px}
    .step-title{display:flex;align-items:center;gap:10px;font-size:1.05rem;font-weight:600;margin-bottom:14px}
    .step-num{display:inline-flex;align-items:center;justify-content:center;width:32px;height:32px;background:#159895;color:#fff;border-radius:50%;font-size:1rem;flex-shrink:0}
    .step-num.done{background:#4caf50}
    .drop-zone{border:2.5px dashed #b0b0b0;border-radius:12px;padding:40px 28px;text-align:center;background:#fafbfc;cursor:pointer;transition:all .25s}
    .drop-zone:hover,.drop-zone.dragover{border-color:#159895;background:#e8f6f6}
    .drop-zone.done{border-color:#4caf50;border-style:solid;background:#f0f9f0}
    .drop-zone input{display:none}
    .drop-zone .dz-icon{font-size:2.8rem;margin-bottom:12px}
    .drop-zone .dz-text{font-size:1.1rem;color:#333;font-weight:600}
    .drop-zone .dz-hint{font-size:.9rem;color:#666;margin-top:10px;line-height:1.6}
    .drop-zone .dz-result{margin-top:14px;font-size:.95rem;font-weight:600}
    .drop-zone .dz-result.ok{color:#4caf50}
    .drop-zone .dz-result.err{color:#c62828}
    .drop-zone .dz-files{margin-top:10px;font-size:.85rem;color:#555;text-align:left;max-height:120px;overflow-y:auto}
    .drop-zone .dz-files ul{padding-left:20px;margin:4px 0 0}
    .drop-zone .dz-files li{margin-bottom:2px}
    .btn{display:inline-block;padding:16px 40px;font-size:1.15rem;font-weight:700;border:none;border-radius:10px;cursor:pointer;transition:all .25s}
    .btn-primary{background:#159895;color:#fff}
    .btn-primary:hover:not(:disabled){background:#128a87;transform:translateY(-2px);box-shadow:0 6px 16px rgba(21,152,149,.3)}
    .btn-primary:disabled{background:#bbb;cursor:not-allowed;transform:none}
    .btn-secondary{background:#fff;color:#159895;border:2px solid #159895;padding:14px 28px;font-size:1.05rem}
    .btn-secondary:hover{background:#e8f6f6}
    .btn-reset{background:#fff;color:#888;border:1px solid #ccc;padding:10px 20px;font-size:.9rem}
    .btn-reset:hover{background:#f5f5f5;color:#555}
    .convert-area{text-align:center;margin:32px 0}
    .convert-area .status{margin-top:14px;font-size:1rem;font-weight:600}
    .convert-area .status.ok{color:#4caf50}
    .convert-area .status.err{color:#c62828}
    .convert-area .error-detail{margin-top:10px;font-size:.85rem;color:#c62828;white-space:pre-wrap;text-align:left;background:#fef5f5;border:1px solid #f5c6c6;border-radius:6px;padding:12px}
    .result-area{margin-top:32px;border:2px solid #159895;border-radius:12px;overflow:hidden;display:none}
    .result-area.visible{display:block}
    .result-header{background:#159895;color:#fff;padding:14px 20px;font-weight:600;font-size:1rem}
    .result-tabs{display:flex;background:#f0f0f0;overflow-x:auto;padding:6px 8px 0;gap:2px}
    .result-tab{padding:12px 20px;cursor:pointer;font-size:.9rem;border-radius:8px 8px 0 0;white-space:nowrap;background:#e8e8e8}
    .result-tab:hover{background:#ddd}
    .result-tab.active{background:#fff;font-weight:600;box-shadow:0 -2px 4px rgba(0,0,0,.05)}
    .result-frame{width:100%;height:65vh;min-height:480px;border:none;display:none;background:#fff}
    .result-frame.active{display:block}
    .result-toolbar{padding:18px 20px;background:#f8f8f8;border-top:1px solid #e0e0e0;display:flex;gap:14px;align-items:center;flex-wrap:wrap}
    .result-toolbar .pdf-hint{font-size:.9rem;color:#555;background:#fff3cd;border:1px solid #e6d58a;border-radius:6px;padding:12px 16px;flex:1;min-width:200px;line-height:1.6}
    .notice{font-size:.82rem;color:#888;margin-top:28px;padding-top:20px;border-top:1px solid #eee;line-height:1.8}
    .security-badge{display:inline-block;background:#e8f5e9;color:#2e7d32;font-size:.85rem;padding:6px 12px;border-radius:6px;margin-top:10px;font-weight:500}
    .dialog-help{display:none;background:#fff8e1;border:1px solid #ffe082;border-radius:8px;padding:16px 20px;margin-top:12px;font-size:.92rem;color:#5d4037;line-height:1.8}
    .dialog-help.visible{display:block}
    .dialog-help strong{color:#e65100}
    .spinner{display:inline-block;width:20px;height:20px;border:3px solid #ddd;border-top:3px solid #159895;border-radius:50%;animation:spin .8s linear infinite;vertical-align:middle;margin-right:8px}
    @keyframes spin{to{transform:rotate(360deg)}}
    @media print{body *{visibility:hidden}.result-area,.result-area *{visibility:visible}.result-area{position:absolute;left:0;top:0;width:100%;border:none}.result-tabs,.result-toolbar,.result-header{display:none!important}}
  </style>
</head>
<body>
  <div class="container">
    <header>
      <h1>届出単位変換ツール</h1>
      <p>年金機構の電子通知書を一覧表形式に変換し、見やすく印刷・PDF保存できます</p>
    </header>
    <main class="main">
      <div class="guide-box">
        <h3>使い方</h3>
        <ol>
          <li>下の枠をクリックして、<strong>通知書が保存されているフォルダ</strong>を選ぶ</li>
          <li><strong>「変換する」</strong>ボタンを押す</li>
          <li>変換結果を確認し、<strong>「印刷 / PDF保存」</strong>ボタンで保存</li>
        </ol>
      </div>

      <div class="step-section">
        <div class="step-title">
          <span class="step-num" id="stepNum1">1</span>
          通知書のフォルダを選ぶ
        </div>
        <div class="drop-zone" id="dropZone">
          <input type="file" id="folderInput" webkitdirectory directory multiple>
          <div class="dz-icon">&#x1F4C2;</div>
          <div class="dz-text">ここをクリックしてフォルダを選択</div>
          <div class="dz-hint">
            年金機構から届いた電子通知書のフォルダを選んでください<br>
            （e-Gov や年金機構のサイトからダウンロードしたフォルダです）
          </div>
          <div class="dz-result" id="dropResult"></div>
          <div class="dz-files" id="dropFiles"></div>
        </div>
        <div class="dialog-help" id="dialogHelp">
          <strong>フォルダの選び方：</strong><br>
          1. 表示されたウィンドウで通知書のフォルダを探してクリック<br>
          2. フォルダの中にファイルが表示されます<br>
          3. そのまま<strong>「アップロード」ボタン</strong>を押してください<br>
          <span style="color:#2e7d32">※「アップロード」と表示されますが、インターネットには送信されません。パソコンの中だけで処理します。</span>
        </div>
      </div>

      <div class="convert-area" id="convertArea">
        <button class="btn btn-primary" id="convertBtn" disabled>変換する</button>
        <div class="status" id="statusMsg"></div>
        <div class="error-detail" id="errorDetail" style="display:none"></div>
      </div>

      <div class="result-area" id="resultArea">
        <div class="result-header" id="resultHeader">変換結果</div>
        <div class="result-tabs" id="resultTabs"></div>
        <div id="resultFrames"></div>
        <div class="result-toolbar">
          <button class="btn btn-secondary" id="printBtn" disabled>印刷 / PDF保存</button>
          <div class="pdf-hint">
            <strong>PDFに保存する手順：</strong><br>
            1.「印刷 / PDF保存」ボタンを押す<br>
            2. 印刷先（送信先）で <strong>「PDFに保存」</strong> を選ぶ<br>
            <span style="font-size:.85em;color:#888">（Windows の場合は「Microsoft Print to PDF」でもOK）</span><br>
            3.「保存」を押して完了
          </div>
        </div>
      </div>

      <div class="convert-area" id="resetArea" style="display:none">
        <button class="btn btn-reset" id="resetBtn">最初からやり直す</button>
      </div>

      <div class="notice">
        ※ 外字を含む電子通知書は変換できない場合があります（年金機構の仕様による制限）<br>
        ※ 推奨ブラウザ：Google Chrome、Microsoft Edge<br>
        <span class="security-badge">&#x1F512; オフラインで動作 &#x2014; ファイルは外部に送信されません</span>
      </div>
    </main>
  </div>

  <script>
HTMLSTART

echo "    var XSL_DATA = $XSL_DATA;" >> "$OUTPUT"

cat >> "$OUTPUT" << 'HTMLEND'

    var ROOT_TO_XSL = {
      'N2018003':'2018003','N2043003':'2043003','N4001004':'4001004',
      'N4002002':'4002002','N4003004':'4003004','N7100001':'7100001',
      'N7110001':'7110001','N7120001':'7120001','N7120002':'7120002',
      'N7130001':'7130001','N7140001':'7140001','N7150001':'7150001',
      'N7240001':'7240001'
    };
    var NOTIF_NAMES = {
      '2018003':'健康保険法第118条 該当・不該当',
      '2043003':'厚生年金 種別変更確認',
      '4001004':'船員保険 標準報酬改定',
      '4002002':'船員保険 標準賞与額決定',
      '4003004':'船員保険 種別変更・標準報酬改定',
      '7100001':'資格取得確認・標準報酬決定',
      '7110001':'資格取得確認・標準報酬決定',
      '7120001':'資格喪失確認',
      '7120002':'資格喪失確認',
      '7130001':'標準報酬決定',
      '7140001':'標準報酬改定',
      '7150001':'標準賞与額決定',
      '7240001':'年間報酬額算定の不該当'
    };

    (function() {
      var dropZone = document.getElementById('dropZone');
      var folderInput = document.getElementById('folderInput');
      var dropResult = document.getElementById('dropResult');
      var dropFiles = document.getElementById('dropFiles');
      var dialogHelp = document.getElementById('dialogHelp');
      var convertBtn = document.getElementById('convertBtn');
      var statusMsg = document.getElementById('statusMsg');
      var errorDetail = document.getElementById('errorDetail');
      var resultArea = document.getElementById('resultArea');
      var resultHeader = document.getElementById('resultHeader');
      var resultTabs = document.getElementById('resultTabs');
      var resultFrames = document.getElementById('resultFrames');
      var printBtn = document.getElementById('printBtn');
      var resetArea = document.getElementById('resetArea');
      var resetBtn = document.getElementById('resetBtn');
      var stepNum1 = document.getElementById('stepNum1');

      var xmlFiles = [];
      var transformedResults = [];
      var iframeReady = {};

      function decodeB64(b64) {
        var raw = atob(b64);
        var bytes = new Uint8Array(raw.length);
        for (var i = 0; i < raw.length; i++) bytes[i] = raw.charCodeAt(i);
        return new TextDecoder('utf-8').decode(bytes);
      }

      function getBaseName(fn) { return fn.replace(/\.[^.]+$/, ''); }

      function parseXml(text) {
        return new DOMParser().parseFromString(text, 'text/xml');
      }

      function transformXml(xmlDoc, xslDoc) {
        var proc = new XSLTProcessor();
        proc.importStylesheet(xslDoc);
        return new XMLSerializer().serializeToString(proc.transformToDocument(xmlDoc));
      }

      function readFileText(file) {
        return new Promise(function(ok, ng) {
          var r = new FileReader();
          r.onload = function() { ok(r.result); };
          r.onerror = function() { ng(new Error('読み込み失敗: ' + file.name)); };
          r.readAsText(file, 'UTF-8');
        });
      }

      function findXslKey(xmlText, fileName) {
        var base = getBaseName(fileName);
        if (XSL_DATA[base]) return base;
        var m = xmlText.match(/<(N\d{7})/);
        if (m && ROOT_TO_XSL[m[1]]) return ROOT_TO_XSL[m[1]];
        return null;
      }

      function readDirEntries(dirEntry) {
        return new Promise(function(resolve) {
          var allFiles = [];
          var reader = dirEntry.createReader();
          (function readBatch() {
            reader.readEntries(function(entries) {
              if (!entries.length) { resolve(allFiles); return; }
              var promises = [];
              entries.forEach(function(entry) {
                if (entry.isDirectory) {
                  promises.push(readDirEntries(entry).then(function(files) {
                    allFiles = allFiles.concat(files);
                  }));
                } else {
                  promises.push(new Promise(function(res) {
                    entry.file(function(f) { allFiles.push(f); res(); });
                  }));
                }
              });
              Promise.all(promises).then(readBatch);
            });
          })();
        });
      }

      dropZone.addEventListener('click', function() {
        dialogHelp.classList.add('visible');
        folderInput.click();
      });

      dropZone.addEventListener('dragover', function(e) {
        e.preventDefault(); dropZone.classList.add('dragover');
      });
      dropZone.addEventListener('dragleave', function() {
        dropZone.classList.remove('dragover');
      });
      dropZone.addEventListener('drop', async function(e) {
        e.preventDefault();
        dropZone.classList.remove('dragover');
        var items = e.dataTransfer.items;
        if (!items || !items.length) return;
        var allFiles = [];
        for (var i = 0; i < items.length; i++) {
          var entry = items[i].webkitGetAsEntry ? items[i].webkitGetAsEntry() : null;
          if (entry && entry.isDirectory) {
            var files = await readDirEntries(entry);
            allFiles = allFiles.concat(files);
          } else if (entry) {
            await new Promise(function(res) {
              entry.file(function(f) { allFiles.push(f); res(); });
            });
          }
        }
        handleFiles(allFiles);
      });

      folderInput.addEventListener('change', function(e) {
        dialogHelp.classList.remove('visible');
        handleFiles(Array.from(e.target.files || []));
      });

      function handleFiles(files) {
        dialogHelp.classList.remove('visible');
        xmlFiles = files.filter(function(f) {
          return f.name.toLowerCase().endsWith('.xml');
        });

        if (files.length === 0) {
          showDropError('フォルダが選択されませんでした。もう一度お試しください。');
          return;
        }

        if (xmlFiles.length === 0) {
          showDropError(
            'このフォルダには通知書ファイルが見つかりませんでした。\n' +
            '年金機構からダウンロードした電子通知書のフォルダを選んでください。'
          );
          return;
        }

        var matched = 0;
        var names = [];
        xmlFiles.forEach(function(f) {
          var base = getBaseName(f.name);
          var xslKey = XSL_DATA[base] ? base : null;
          var label = NOTIF_NAMES[base] || f.name;
          if (xslKey) {
            matched++;
            names.push('<li style="color:#2e7d32">&#x2714; ' + label + '</li>');
          } else {
            names.push('<li style="color:#999">&#x25CB; ' + f.name + '（確認中...変換時に判定します）</li>');
          }
        });

        if (matched > 0) {
          dropResult.textContent = '通知書 ' + xmlFiles.length + ' 件を検出しました';
          dropResult.className = 'dz-result ok';
        } else {
          dropResult.textContent = '通知書 ' + xmlFiles.length + ' 件を検出（変換時に対応を確認します）';
          dropResult.className = 'dz-result ok';
        }
        dropFiles.innerHTML = '<ul>' + names.join('') + '</ul>';
        convertBtn.disabled = false;
        dropZone.classList.add('done');
        stepNum1.classList.add('done');
      }

      function showDropError(msg) {
        dropResult.textContent = msg;
        dropResult.className = 'dz-result err';
        dropFiles.innerHTML = '';
        convertBtn.disabled = true;
        dropZone.classList.remove('done');
        stepNum1.classList.remove('done');
      }

      convertBtn.addEventListener('click', async function() {
        statusMsg.innerHTML = '<span class="spinner"></span>変換しています...';
        statusMsg.className = 'status';
        errorDetail.style.display = 'none';
        convertBtn.disabled = true;
        printBtn.disabled = true;

        transformedResults = [];
        iframeReady = {};
        var errors = [];
        var skipped = [];

        for (var i = 0; i < xmlFiles.length; i++) {
          var xmlFile = xmlFiles[i];
          try {
            var xmlText = await readFileText(xmlFile);
            var xslKey = findXslKey(xmlText, xmlFile.name);

            if (!xslKey) {
              skipped.push(xmlFile.name);
              continue;
            }

            var xslText = decodeB64(XSL_DATA[xslKey]);
            var xmlDoc = parseXml(xmlText);

            if (xmlDoc.querySelector('parsererror')) {
              errors.push(xmlFile.name + '：ファイルの形式に問題があるため変換できませんでした');
              continue;
            }

            var xslDoc = parseXml(xslText);
            var html = transformXml(xmlDoc, xslDoc);
            var label = NOTIF_NAMES[xslKey] || xmlFile.name;
            transformedResults.push({ name: xmlFile.name, label: label, html: html });
          } catch (e) {
            errors.push(xmlFile.name + '：' + (e.message || '変換中にエラーが発生しました'));
          }
        }

        if (transformedResults.length > 0) {
          statusMsg.textContent = '変換完了！ ' + transformedResults.length + ' 件を一覧表形式に変換しました。';
          statusMsg.className = 'status ok';
          renderResults();
          resultArea.classList.add('visible');
          resetArea.style.display = 'block';
          setTimeout(function() {
            resultArea.scrollIntoView({ behavior: 'smooth', block: 'start' });
          }, 100);
        } else {
          statusMsg.textContent = '変換できる通知書がありませんでした。正しいフォルダを選んでいるか確認してください。';
          statusMsg.className = 'status err';
          convertBtn.disabled = false;
        }

        var msgs = [];
        if (errors.length > 0) msgs = msgs.concat(errors);
        if (skipped.length > 0) msgs.push('以下のファイルは対応していない形式のため変換しませんでした：\n  ' + skipped.join(', '));
        if (msgs.length > 0) {
          errorDetail.textContent = msgs.join('\n');
          errorDetail.style.display = 'block';
        }
      });

      function renderResults() {
        resultTabs.innerHTML = '';
        resultFrames.innerHTML = '';
        resultHeader.textContent = '変換結果（' + transformedResults.length + '件）';

        transformedResults.forEach(function(r, i) {
          var tab = document.createElement('div');
          tab.className = 'result-tab' + (i === 0 ? ' active' : '');
          tab.textContent = r.label;
          tab.title = r.name;
          tab.addEventListener('click', function() {
            resultTabs.querySelectorAll('.result-tab').forEach(function(t) { t.classList.remove('active'); });
            resultFrames.querySelectorAll('.result-frame').forEach(function(f) { f.classList.remove('active'); });
            tab.classList.add('active');
            resultFrames.children[i].classList.add('active');
          });
          resultTabs.appendChild(tab);

          var iframe = document.createElement('iframe');
          iframe.className = 'result-frame' + (i === 0 ? ' active' : '');
          iframe.addEventListener('load', function() {
            iframeReady[i] = true;
            var allReady = transformedResults.every(function(_, idx) { return iframeReady[idx]; });
            if (allReady) {
              printBtn.disabled = false;
              convertBtn.disabled = false;
            }
          });
          resultFrames.appendChild(iframe);
          iframe.srcdoc = r.html;
        });
      }

      printBtn.addEventListener('click', function() {
        var activeFrame = resultFrames.querySelector('.result-frame.active');
        if (!activeFrame) {
          alert('表示中の通知書がありません。');
          return;
        }
        try {
          activeFrame.contentWindow.print();
        } catch (e) {
          alert('印刷を開始できませんでした。\nブラウザを Google Chrome または Microsoft Edge に変更してお試しください。');
        }
      });

      resetBtn.addEventListener('click', function() {
        xmlFiles = [];
        transformedResults = [];
        iframeReady = {};
        dropResult.textContent = '';
        dropResult.className = 'dz-result';
        dropFiles.innerHTML = '';
        statusMsg.textContent = '';
        statusMsg.className = 'status';
        errorDetail.style.display = 'none';
        resultArea.classList.remove('visible');
        resetArea.style.display = 'none';
        convertBtn.disabled = true;
        printBtn.disabled = true;
        dropZone.classList.remove('done');
        stepNum1.classList.remove('done');
        folderInput.value = '';
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });
    })();
  </script>
</body>
</html>
HTMLEND

echo ""
echo "ビルド完了: $OUTPUT"
echo "ファイルサイズ: $(wc -c < "$OUTPUT") bytes"
