###!
 * jquery.videoAnimatePlay
 *
 * http://lab.hisasann.com/videoAnimatePlay/
 * Copyright 2014 hisasann
 * Released under the MIT license
###
((global) ->
  'use strict'
  # requestAnimationFrame
  (->
    lastTime = 0
    vendors = [
      "ms"
      "moz"
      "webkit"
      "o"
    ]
    x = 0

    while x < vendors.length and not global.requestAnimationFrame
      global.requestAnimationFrame = global[vendors[x] + "RequestAnimationFrame"]
      global.cancelRequestAnimationFrame = global[vendors[x] + "CancelRequestAnimationFrame"]
      ++x
    unless global.requestAnimationFrame
      global.requestAnimationFrame = (callback) ->
        currTime = new Date().getTime()
        timeToCall = Math.max(0, 16 - (currTime - lastTime))
        id = global.setTimeout(->
          callback currTime + timeToCall
          return
        , timeToCall)
        lastTime = currTime + timeToCall
        id
    unless global.cancelAnimationFrame
      global.cancelAnimationFrame = (id) ->
        clearTimeout id
        return
    return
  )()
)(@)

$.videoAnimatePlay = (options) ->
  animate = (opts) ->
    start = new Date

    (frameLoop = () ->
      timePassed = new Date - start
      progress = timePassed / opts.duration

      progress = 1  if progress > 1

      delta = opts.delta(progress)
      opts.step delta

      if progress is 1
        opts.callback()
        return

      requestAnimationFrame(frameLoop)
    )()
    return

  animate
    duration: options.duration or 1000
    delta: options.easing
    step: (delta) ->
      options.element.currentTime = (options.to - options.from) * delta + options.from
      return
    callback: options.callback

  return
