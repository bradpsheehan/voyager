import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import { Map } from 'immutable'

import ApplicationPortal from '../application_portal/containers/ApplicationPortal'
import reducer from '../application_portal/reducers/'

document.addEventListener('DOMContentLoaded', () => {
    const config = window.applicationPortalConfig()

    let initialState = {
        root: Map({
          applicant: config.applicant,
          job: config.job
        })
    }

    const store = createStore(reducer, initialState, window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__())

    ReactDOM.render(
        <Provider store={store}>
            <ApplicationPortal
              applicant={config.applicant}
              job={config.job}
              initialValues={{applicant_id: config.applicant.id, job_id: config.job.id}}
            />
        </Provider>,
        document.body.appendChild(document.getElementById('application-portal')),
    )
})
