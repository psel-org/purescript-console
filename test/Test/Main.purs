module Test.Main where

import Effect.Class.Console (clear, error, info, log, time, timeEnd, timeLog, warn)
import Prelude

import Effect (Effect)

main :: Effect Unit
main = do
  log "log test"
  warn "warn test"
  error "error test"
  info "info test"
  time "a"
  time "b"
  timeLog "a"
  timeLog "b"
  timeEnd "a"
  timeEnd "b"
  clear
