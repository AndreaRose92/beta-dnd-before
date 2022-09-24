import React from 'react'
import {FullCaster} from '../../tools/Hooks'

export const SorcererHeader = () => {
  return (
    <>
      <h2>Sorcerery Points</h2>
      <h2>Features</h2>
      <h2>Cantrips Known</h2>
      <h2>Spells Known</h2>
      <FullCaster variant="Sorcerer"/>
    </>
  )
}

export const SorcererRows = () => {
  return (
       <>
            <div>Sorcerer</div>
       </>
  )
}