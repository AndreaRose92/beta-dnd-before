import React from 'react'
import {FullCaster} from '../../hookComponents/Hooks'

export const DruidHeader = () => {
  return (
     <React.Fragment>
        <h2>Features</h2>
        <h2>Cantrips Known</h2>
        <FullCaster variant="Druid"/>
     </React.Fragment>
  )
}

export const DruidRows = () => {
   return (
        <React.Fragment>
             <div>Druid</div>
        </React.Fragment>
   )
}