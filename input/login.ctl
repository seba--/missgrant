
events
  logon LOG
  accepted ACC
  declined DCL
  retry  RETR
  logout LOUT
end

// correspond to service invokations
// or generate events for other state machines (e.g. the authorizer)
commands
  authorize AUTH 
  createMenu MEN
  showError ERR
end

state init
  logon => login
end

state login
  actions {authorize}
  accepted => authorized
  declined => error
end

state authorized
  actions {createMenu}
  // do stuff
  logout => init
end

state error
  actions {showError}
  retry => init
end