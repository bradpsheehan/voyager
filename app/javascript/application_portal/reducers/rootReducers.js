import { Map } from 'immutable'

export const initialState = Map({
})

export const ACTION_ADD_AUDIO_RECORD = 'ACTION_ADD_AUDIO_RECORD'

export const addAudioRecord = (newAudioRecord) => { return { type: ACTION_ADD_AUDIO_RECORD, newAudioRecord: newAudioRecord } }

const rootReducer = (state = initialState, action) => {
  let newState
  switch (action.type) {
    case ACTION_ADD_AUDIO_RECORD:
      newState = state
    default:
      newState = state
  }
  return newState
}

export default rootReducer
