import React from 'react'
import { TableRow } from '../../styles/Details.style'

export const BarbarianHeader = () => {

     return (
          <React.Fragment>
               <h2>Features</h2>
               <h2>Rages</h2>
               <h2>Rage Damage</h2>
          </React.Fragment>
     )
}

export const BarbarianRows = ({levels}) => {
     
     const renderRows = levels.map(level => {

          const rageCount = parseInt(level.class_specific.split(' ')[1].split(',')[0])
          const rageDamage = parseInt(level.class_specific.split(' ')[3].split(',')[0])

          return(
               <TableRow level={level.level} variant="Barbarian">
                    <h2>{level.level}</h2>
                    <h2>{level.prof_bonus}</h2>
                    <h2>{level.features}</h2>
                    <h2>{rageCount}</h2>
                    <h2>{rageDamage}</h2>
               </TableRow>
          )
     })
     
     return (
          <React.Fragment>{renderRows}</React.Fragment>
     )
}