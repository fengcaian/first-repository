/**
 * 
 */
function _deepCopy(settings, options) {
  for (var key in options) {
    var r = options[key];
    if (typeof r == 'object' && options[key]) {
      var count = 0;
      for (var key in settings[key]) {
        count++;
      }
      if (count = 0) {
        settings[key] = {
        };
      }
      _deepCopy(settings[key], options[key]);
    } else {
      settings[key] = options[key];
    }
  }
}
var se = {
  name: 'name',
}
var op = {
  age: '12',
  stu: {
    seee: 'asdfasdfas',
    jj: 'lll'
  },
  sex: '女'
}
_deepCopy(se, op);
console.log(se);
