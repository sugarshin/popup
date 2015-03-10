###!
 * @license popup
 * (c) sugarshin
 * License: MIT
###

"use strict"

do (root = this, factory = (objectAssign) ->

  if objectAssign is undefined then objectAssign = (out) ->
    out or= {}
    for i in [1...arguments.length]
      unless arguments[i] then continue
      for own key, val of arguments[i]
        out[key] = val
    return out

  class Popup

    _defaults:
      width: 640
      height: 800
      url: null
      name: 'popup'

    setURL: ->
      if (url = @el.getAttribute('href'))?
        @_url = url
      else
        @_url = @opts.url

    setParam: ->
      if (w = @el.getAttribute('data-popup-width'))?
        width = w
      else
        width = @opts.width

      if (h = @el.getAttribute('data-popup-heigt'))?
        height = h
      else
        height = @opts.height

      x = (window.screen.width - width) / 2
      y = (window.screen.height - height) / 2

      @_param = "screenX=#{x},screenY=#{y},left=#{x},top=#{y},width=#{width},height=#{height},toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes"

    constructor: (@el, opts) ->
      @opts = objectAssign {}, @_defaults, opts
      @setURL()
      @setParam()

    open: ->
      window.open @_url, @opts.name, @_param
      return this

    @open: (el) ->
      popup = new Popup el
      popup.open()

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory require 'object-assign'
  else
    root.Popup or= factory()
  return
