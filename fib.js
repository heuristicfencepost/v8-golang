// Simple accumulator-based Fibonacci implementation
function fib(a,b,count) {
  function _fib(_a,_b,_count,_accum) {
    if (_count <= 0) { 
      return _accum;
    }
    var n = _a + _b;
    return _fib(_b,n,(_count - 1),_accum + "," + n);
  }
  return _fib(a,b,(count - 2),a + "," + b);
}
fib(0,1,10);

