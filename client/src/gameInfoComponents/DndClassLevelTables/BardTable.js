import React from 'react'
import { FullCaster } from '../../hookComponents/Hooks'

export const BardHeader = () => {
  return (
    <>
     <h2>Features</h2>
     <h2>Cantrips Known</h2>
     <h2>Spells Known</h2>
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