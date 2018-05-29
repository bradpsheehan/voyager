import React from 'react'

export const FormSubmissionButton = ({submitting, invalid}) => {
  return (
    <div className='submission-wrapper'>
      {!submitting && <button type='submit' className='btn btn-primary' disabled={invalid} data-role='submit'>
        Submit your application
      </button>}
      {submitting && <div className='submitting' data-role='spinner'>
        Saving...
      </div>}
    </div>
  )
}

export default FormSubmissionButton
