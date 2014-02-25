# videoAnimatePlay with jQuery
===

I will play an animation video of video tag.  As applications, I can be used in reverse playback.

## Overview
===

to move the currentTime of the video, you have to seek as flip book. 

Problem is that canplay events from being fire many times. 

site of iPad Air also in the same way, it seems to have done the reverse playback of video.

Video, 
[www.swiftkey.net](http://www.swiftkey.net/en/note/)
I have borrowed from the site.


## Examples
===

### CoffeeScript


```coffeescript
$.videoAnimatePlay(
  element: @
  easing: (p) ->
    return p
  duration: 5000
  from: 5
  to: 0
  callback: () =>
    @.play()
    frameLoop()
)
```
### JavaScript


```javascript
$.videoAnimatePlay({
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
```

## Demo
===

[http://lab.hisasann.com/videoAnimatePlay/](http://lab.hisasann.com/videoAnimatePlay/)

## License

Copyright (c) 2014 hisasann. Released under the MIT license.


enjoy!
