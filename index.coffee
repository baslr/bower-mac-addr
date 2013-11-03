
define (require, exports, module) ->
  
  module.exports.getUnicast = ->
    # first byte 0000:0000
    # last bit 0 is single address
    # last bit 1 is group  address
    
    hex   = ''
    array = new Uint8Array 24
  
    window.crypto.getRandomValues array
    hex += n.toString 16 for n in array
    
    mac = hex.slice(0,12).match(/.{2}/g).join ':'                                 # generate macaddress
    bin = "0000#{parseInt(mac.charAt(1), 16).toString 2}".slice -4                # get the 2nd part of the first byte convert it to binary and slice 4 digits
    bin = "#{bin.slice 0,3}0"                                                     # use 0-3 and add a 0 (to make it a single address)
    return "#{mac.charAt 0}#{parseInt(bin, 2).toString 16}:#{mac.slice 3}"        # return everything
    
  module.exports.getMulticast = ->
    # first byte 0000:0000
    # last bit 0 is single address
    # last bit 1 is group  address
    
    hex   = ''
    array = new Uint8Array 24
  
    window.crypto.getRandomValues array
    hex += n.toString 16 for n in array
    
    mac = hex.slice(0,12).match(/.{2}/g).join ':'                                 # generate macaddress
    bin = "0000#{parseInt(mac.charAt(1), 16).toString 2}".slice -4                # get the 2nd part of the first byte convert it to binary and slice 4 digits
    bin = "#{bin.slice 0,3}1"                                                     # use 0-3 and add a 1 (to make it a group address)
    return "#{mac.charAt 0}#{parseInt(bin, 2).toString 16}:#{mac.slice 3}"        # return everything  
  
  undefined                                                                       # return nothing
