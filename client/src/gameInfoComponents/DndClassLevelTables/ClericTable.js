import React from 'react'
import { FullCaster } from '../../hookComponents/Hooks'

export const ClericHeader = () => {
  return (
    <React.Fragment>
     <h2>Features</h2>
     <h2>Cantrips Known</h2>
     <FullCaster variant="Cleric"/>
    </React.Fragment>
  )
}

export const ClericRows = () => {
  return (
       <React.Fragment>
            <div>Cleric</div>
       </React.Fragment>
  )
}