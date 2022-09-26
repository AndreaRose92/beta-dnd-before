import React from 'react'
import { TableRow } from '../../styles/Details.style'
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

export const WizardRows = ({levels, spells}) => {
  
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