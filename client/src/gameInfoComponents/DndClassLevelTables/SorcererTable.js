import React from 'react'
import {FullCaster} from '../../hookComponents/Hooks'

export const SorcererHeader = () => {
  return (
    <React.Fragment>
      <h2>Sorcerery Points</h2>
      <h2>Features</h2>
      <h2>Cantrips Known</h2>
      <h2>Spells Known</h2>
      <FullCaster variant="Sorcerer"/>
    </React.Fragment>
  )
}

export const SorcererRows = () => {
  return (
       <React.Fragment>
            <div>Sorcerer</div>
       </React.Fragment>
  )
}