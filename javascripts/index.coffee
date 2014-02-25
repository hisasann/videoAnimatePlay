# DomReady
$ ->
  isCanplay = false
  $('#video').on('canplay', () ->
    console.log 'canplay'
    if isCanplay
      return

    @.play()

    (frameLoop = () =>
      setTimeout(() =>
        @.pause()
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
      , 5000)
    )()

    isCanplay = true
  )
