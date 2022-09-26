import React from 'react'
import { FullCaster } from '../../hookComponents/Hooks'
import { TableRow } from '../../styles/Details.style'

export const BardHeader = () => {
  return (
    <React.Fragment>
     <h2>Features</h2>
     <h2>Cantrips Known</h2>
     <h2>Spells Known</h2>
     <FullCaster variant="Bard"/>
    </React.Fragment>
  )
}

export const BardRows = ({levels}) => {

  const renderRows = levels.map(level => {

    return (
      <TableRow level={level.level} variant="Bard">
        <h2>{level.level}</h2>
        <h2>{level.prof_bonus}</h2>
        <h2>{level.features}</h2>
      </TableRow>
    )

  })

  return (
       <React.Fragment>{renderRows}</React.Fragment>
  )
}