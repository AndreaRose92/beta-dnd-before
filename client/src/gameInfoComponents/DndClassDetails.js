import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { ClassDetailVariants, ClassHeaderVariants } from '../hookComponents/PlayerEvents'
import { DetailGrid, LevelsTable, TableGrid, TableHeader, TableRow, TitleCard } from '../styles'
import { DetailsPane } from '../styles/Details.style'

export const DndClassDetails = () => {

     const params = useParams()
     const [dndClass, setDndClass] = useState(null)
     const [infoDisplay, setInfoDisplay] = useState(0)
     const [details, setDetails] = useState('')
     const levels = dndClass ? dndClass.dnd_class_levels : null

     useEffect(()=>{
          fetch(`/dnd_classes/${params.dnd_class}`).then(r=>{
               if (r.ok) {
                    r.json().then(data=>setDndClass(data))
               } else {
                    r.json().then(errors=>console.log(errors))
               }
          })
          setInfoDisplay(0)
          setDetails('')
     }, [params.dnd_class])

     const filterFeatures = array => {
          let names = []
          switch (dndClass.name) {
               case "Barbarian":
                    names = array
                    break;
               case "Bard":
                    names = array.filter(name => !(name.includes('Bard')) && !(name.includes("Song")) )
                    break;
               case "Cleric":
                    names = array.filter(name => !(name.includes("Channel")) && !(name.includes("Undead")) && !(name.includes("Cleric")))
                    break;
               case "Druid":
                    names = array.filter(name => !(name.includes("Wild")) && !(name.includes("Druid")) && !(name.includes("Circle of the")))
                    break;
               case "Fighter":
                              names = array.filter(name => !(name.includes("Action")) && !(name.includes('Extra')) && !(name.includes("Indomitable")) && !(name.includes("Style:")))
                    break;
               case "Monk":
                    names = array.filter(name => !(name.includes("Martial")) && !(name.includes("Unarmored")))
                    break;
               case "Paladin":
                    names = array.filter(name => !(name.includes("Paladin")) && !(name.includes("Fighting")) && !(name.includes("Channel")))
                    break;
               case "Ranger":
                    names = array.filter(name => !(name.includes("Favored")) && !(name.includes("Ranger")) && !(name.includes("Natural")) && !(name.includes("Fighting")) && !(name.includes("Prey:")) && !(name.includes("Tactics:")) && !(name.includes("Defense:")))
                    break;
               case "Rogue":
                    names = array.filter(name => !(name.includes("Sneak")))
                    break;
               case "Sorcerer":
                    names = array.filter(name => !(name.includes("Sorcerer")) && !(name.includes("Casting")) && !(name.includes("Metamagic")) && !(name.includes("Ancestor:")))
                    break;
               case "Warlock":
                    names = array.filter(name => !(name.includes("Eldritch")) && !(name.includes("Mystic")) && !(name.includes("Pact of")))
                    break;
               case "Wizard":
                    names = array.filter(name => !(name.includes("Wizard")) && !(name.includes("Arcane")))
                    break;
          }
          return names
     }

     const renderRows = levels ? levels.map(level => {

          const features = filterFeatures(dndClass.features.filter(feature => feature.level === level.level).map(feature => feature.name)).join(', ')

          return (
               <TableRow key={level.level} level={level.level} variant={dndClass.name} onClick={()=>setInfoDisplay(level.level)}>
                    <h2>{level.level}</h2>
                    <h2>{level.prof_bonus}</h2>
                    <h2>{features !== '' ? features : '-'}</h2>
                    {ClassDetailVariants(level, dndClass.name)}
               </TableRow>
          )
     }) : null

     const renderDetails = infoDisplay !== 0 ? dndClass.features.filter(feature => feature.level === infoDisplay).map(
          feature => {

               const checkDetail = () => {
                    details !== feature.name ? setDetails(feature.name) : setDetails('')
               }

               return (
                    <React.Fragment key={feature.name}>
                         <h1 onClick={checkDetail}>{feature.name}</h1>
                         {details === feature.name ? <h3>{feature.desc}</h3> : null}
                    </React.Fragment>
               )
          }
     ) : null

     while (dndClass === null) {
          return <div><h4>Loading...</h4></div>
     }

  return (
    <DetailGrid>
     <h1>{dndClass.name} Levels</h1>
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
     {infoDisplay !== 0 ? <DetailsPane>
          <h1>Additional Details</h1>
          {renderDetails}
     </DetailsPane> : null}
    </DetailGrid>
  )
}
