import React from 'react'
import { connect } from 'react-redux'
import { Field } from 'redux-form'
import PropTypes from 'prop-types'
import { reduxForm } from 'redux-form'
import FormSubmissionButton from '../components/FormSubmissionButton'
import Slider from 'react-rangeslider'
import { SubmissionError } from 'redux-form'
import axios from 'axios'

export const experienceSlider = (props) => {
  const labels = {
    0: '0', 1: '1',
    2: '2', 3: '3',
    4: '4', 5: '5',
    6: '6', 7: '7',
    8: '8', 9: '9',
    10: '10+'
  }

  return (
    <div>
      <label className="slider-label">{props.label}</label>
      <Slider
        min={0}
        max={10}
        labels={labels}
        value={parseInt(props.input.value) || 0}
        onChange={props.input.onChange}
      />
    </div>

  )
}

export const mapStateToProps = (state) => {
  return {}
}

export const mapDispatchToProps = (dispatch) => {
  return {}
}

const RangeSliders = (props) => {
  const experiences = props.experiences;
  const sliders = experiences.map((experience) =>
    <div className="form-group form-slider" key={experience}>
      <Field label={experience} name={experience} component={experienceSlider} />
    </div>
  );
  return (
    <div>{sliders}</div>
  );
}

export class ApplicationPortal extends React.Component {
  constructor (props) {
    super(props)

    this.state = {
      submitting: false,
      application_complete: false
    }
  }

  submit = (values) => {
    this.setState({ submitting: true })
    console.log('values', values)

    return axios.post('/applications',
      { job_application: {
        applicant_id: values.applicant_id,
        job_id: values.job_id,
        experiences: values
      }}).then((res) => {
      this.setState({submitting: false, application_complete: true})
    }).catch((err) => {
      this.setState({submitting: false})
      throw new SubmissionError(err.errors)
    })
  }

  render () {
    const { job, applicant, handleSubmit } = this.props
    const { submitting, application_complete } = this.state

    return (
      <div className="row">
        {!application_complete && <div className="col-md-12 form-container">
          <div className="header-block">
            <h2>Hi {applicant.first_name}. You're application is almost done!</h2>
            <h5>Please provide your years of experience in the following areas:</h5>
          </div>

          <form onSubmit={handleSubmit(this.submit)}>
            <Field name='applicant_id' component='input' type="hidden" />
            <Field name='job_id' component='input' type="hidden" />
            <RangeSliders experiences={job.experiences} />

            <div className='form-row'>
              <div className='form-col form-col--full txt-center'>
                <FormSubmissionButton submitting={submitting} />
              </div>
            </div>
          </form>
        </div>}

        {application_complete && <div className="col-md-12 form-container">
          <div className="header-block">
            <h2>You're a rockstar! Thanks for applying for: {job.title}!</h2>
            <h5>You will hear from us within a week with more information about your application</h5>
          </div>
        </div>}
      </div>
    )
  }
}


let reduxFormDetails = {
  form: 'workExperienceForm'
}


export default connect(mapStateToProps, mapDispatchToProps)(reduxForm(reduxFormDetails)(ApplicationPortal))

