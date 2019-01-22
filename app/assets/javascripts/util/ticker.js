if (!Array.prototype.flatten) {
  Array.prototype.flatten = function() {
    let out = [];

    for(let sub of this) {
      out = [...out, ...sub];
    }

    return out;
  }
}

const stringArrayToCharArray = function(strings) {
  return strings.map(string => {
    let stringSteps = [];
    for (let i = 1; i < string.length + 1; i++) {
      stringSteps.push(string.slice(0, i));
    }

    return [...stringSteps, ...stringSteps.reverse().slice(1, stringSteps.length)];
  }).flatten();
}

const tickerType = ($node, strings, { delay, fullWordDelay, repeat } = {}) => {
  let steps = stringArrayToCharArray(strings);

  if (!repeat) {
    // unless it repeats, you want to slice off the last word shorterning
    steps = steps.slice(0, steps.indexOf(strings[strings.length - 1]) + 1);
  }
  
  let idx = 0;
  let loop = setInterval(() => {
    let string = steps[Math.floor(idx)];
    $node.text(string);

    if (idx >= steps.length - 1) {
      if (repeat) {
        idx = 0;
      } else {
        clearInterval(loop);
      }
    } else if (-1 === strings.indexOf(string)) {
      idx++;
    } else {
      idx += (delay / fullWordDelay);
    }
  }, delay);
};

$(document).on('turbolinks:load', function() {
  $('[data-ticker-texts]').each(function() {
    const $node         = $(this);
    const strings       = $node.attr('data-ticker-texts').split('|')
    const delay         = +$node.attr('data-delay');
    const fullWordDelay = +$node.attr('data-full-word-delay');
    const repeat        = $node.attr('data-repeat') === 'true';

    tickerType($node, strings, { delay, fullWordDelay, repeat });
  });
});