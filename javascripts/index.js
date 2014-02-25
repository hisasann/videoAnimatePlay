// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    var isCanplay;
    isCanplay = false;
    return $('#video').on('canplay', function() {
      var frameLoop,
        _this = this;
      console.log('canplay');
      if (isCanplay) {
        return;
      }
      this.play();
      (frameLoop = function() {
        return setTimeout(function() {
          _this.pause();
          return $.videoAnimatePlay({
            element: _this,
            easing: function(p) {
              return p;
            },
            duration: 5000,
            from: 5,
            to: 0,
            callback: function() {
              _this.play();
              return frameLoop();
            }
          });
        }, 5000);
      })();
      return isCanplay = true;
    });
  });

}).call(this);