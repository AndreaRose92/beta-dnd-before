import React from 'react'
import {FullCaster} from '../../hookComponents/Hooks'

export const WizardHeader = () => {
  return (
    <React.Fragment>
      <h2>Features</h2>
      <h2>Cantrips Known</h2>
      <FullCaster variant="Wizard"/>
    </React.Fragment>
  )
}

export const WizardRows = () => {
  return (
       <React.Fragment>
            <div>Wizard</div>
       </React.Fragment>
  )
}