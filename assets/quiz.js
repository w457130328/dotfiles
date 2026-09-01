/* Reusable quiz widget.
 * Usage: <div class="quiz" data-quiz='[{ "q": "...", "options": ["A","B","C"], "answer": 0, "explain": "..." }]'></div>
 * Each option should be the same length/word-count so formatting gives no hint.
 * Feedback is immediate: pick once, correct answer is revealed, explanation shown.
 */
(function () {
  'use strict';

  function renderQuiz(root) {
    var data;
    try {
      data = JSON.parse(root.getAttribute('data-quiz'));
    } catch (e) {
      root.textContent = 'quiz 数据格式错误';
      return;
    }
    if (!Array.isArray(data)) return;

    root.innerHTML = '';
    data.forEach(function (item, qi) {
      var q = document.createElement('div');
      q.className = 'q';

      var prompt = document.createElement('div');
      prompt.className = 'prompt';
      prompt.textContent = (qi + 1) + '. ' + item.q;
      q.appendChild(prompt);

      var opts = document.createElement('div');
      opts.className = 'opts';
      var fb = document.createElement('div');
      fb.className = 'feedback';

      item.options.forEach(function (text, oi) {
        var b = document.createElement('button');
        b.type = 'button';
        b.className = 'opt';
        b.textContent = text;
        b.addEventListener('click', function () {
          q.querySelectorAll('.opt').forEach(function (x) { x.disabled = true; });
          var correct = q.querySelectorAll('.opt')[item.answer];
          if (oi === item.answer) {
            b.classList.add('correct');
            fb.textContent = '✓ 正确。' + (item.explain || '');
            fb.className = 'feedback ok';
          } else {
            b.classList.add('wrong');
            correct.classList.add('correct');
            fb.textContent = '✗ 不对，正确答案已标出。' + (item.explain || '');
            fb.className = 'feedback bad';
          }
        });
        opts.appendChild(b);
      });

      q.appendChild(opts);
      q.appendChild(fb);
      root.appendChild(q);
    });
  }

  document.querySelectorAll('.quiz').forEach(renderQuiz);
})();
