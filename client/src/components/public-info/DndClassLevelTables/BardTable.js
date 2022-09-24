import React from 'react'
import { FullCaster } from '../../tools/Hooks'

export const BardHeader = () => {
  return (
    <>
     <h2>Features</h2>
     <h2>Cantrips Known</h2>
     <h2>Spells Known</h2>
     <h3>Spell Slots by Spell Level</h3>
     <FullCaster variant="Bard"/>
    </>
  )
}

export const BardRows = () => {
  return (
       <>
            <div>Bard</div>
       </>
  )
}