import React from 'react'
import { TableRow } from '../../styles/Details.style'

export const MonkHeader = () => {
  return (
    <React.Fragment>
      <h2>Martial Arts</h2>
      <h2>Ki Points</h2>
      <h2>Unarmored Movement</h2>
      <h2>Features</h2>
    </React.Fragment>
  )
}

export const MonkRows = ({levels, spells}) => {
  
  const renderRows = levels && spells ? levels.map(level => {

    let spell = level ? spells[level.level - 1] : null

    return (
      <TableRow>
      </TableRow>
    )

  }) : null
  
  return (
       <React.Fragment>
            {renderRows}
       </React.Fragment>
  )
}