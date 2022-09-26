import React from 'react'
import {HalfCaster} from '../../hookComponents/Hooks'

export const RangerHeader = () => {
  return (
    <React.Fragment>
      <h2>Features</h2>
      <h2>Spells Known</h2>
      <HalfCaster variant="Ranger" />
    </React.Fragment>
  )
}

export const RangerRows = () => {
  return (
       <React.Fragment>
            <div>Ranger</div>
       </React.Fragment>
  )
}