import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { ClassDetailVariants, ClassHeaderVariants } from '../hookComponents/PlayerEvents'
import { DetailGrid, LevelsTable, TableGrid, TableHeader, TableRow, TitleCard } from '../styles'

export const DndClassDetails = () => {

     const params = useParams()
     const [dndClass, setDndClass] = useState(null)
     const levels = dndClass ? dndClass.dnd_class_levels : null

     useEffect(()=>{
          fetch(`/dnd_classes/${params.dnd_class}`).then(r=>{
               if (r.ok) {
                    r.json().then(data=>setDndClass(data))
               } else {
                    r.json().then(errors=>console.log(errors))
               }
          })
     }, [params.dnd_class])

     const renderRows = levels ? levels.map(level => {

          const features = dndClass.filtered_features.filter(feature => feature.level === level.level).map(feature => feature.name).join(', ')

          return (
               <TableRow key={level.level} level={level.level} variant={dndClass.name}>
                    <h2>{level.level}</h2>
                    <h2>{level.prof_bonus}</h2>
                    <h2>{features}</h2>
                    {ClassDetailVariants(level, dndClass.name)}
               </TableRow>
          )
     }) : null


     while (dndClass === null) {
          return <div><h4>Loading...</h4></div>
     }

  return (
    <DetailGrid>
     <TitleCard>
          <h1>{dndClass.name}</h1>
     </TitleCard>
     <LevelsTable>
          <TableHeader variant={dndClass.name}>
               <h2>Level</h2>
               <h2>Prof Bonus</h2>
               <h2>Features</h2>
               {ClassHeaderVariants(dndClass.name)}
          </TableHeader>
          <TableGrid>
               {renderRows}
          </TableGrid>
     </LevelsTable>
    </DetailGrid>
  )
}
