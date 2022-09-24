import React, { useEffect, useState } from 'react'
import { getRequest } from '../tools/FetchTypes'
import { DetailGrid, LevelsTable, TableGrid, TableHeader, TitleCard } from '../styles/Details.style'
import * as All from './DndClassLevelTables/'
import { useParams } from 'react-router-dom'

export const DndClassDetails = () => {

  const params = useParams()

  const [dndClassLevels, setDndClassLevels] = useState(null)
  useEffect(()=>{getRequest(`/dnd_class_levels/${params.dnd_class}`, setDndClassLevels)},[params.dnd_class])

  const renderHeader = () => {
    if (dndClassLevels !== null) {
      switch (dndClassLevels[0].dnd_class.name) {
        case "Barbarian": return <All.BarbarianHeader />;
        case "Bard": return <All.BardHeader />;
        case "Cleric": return <All.ClericHeader />;
        case "Druid": return <All.DruidHeader />;
        case "Fighter": return <All.FighterHeader />;
        case "Monk": return <All.MonkHeader />;
        case "Paladin": return <All.PaladinHeader />;
        case "Ranger": return <All.RangerHeader />;
        case "Rogue": return <All.RogueHeader />;
        case "Sorcerer": return <All.SorcererHeader />;
        case "Warlock": return <All.WarlockHeader />;
        case "Wizard": return <All.WizardHeader />;
        default: return <h1>Damn Dude, you broke it!</h1>;
    }}
  }

  const renderRows = () => {
    if (dndClassLevels !== null) {
      switch (dndClassLevels[0].dnd_class.name) {
        case "Barbarian": return <All.BarbarianRows levels={dndClassLevels}/>;
        case "Bard": return <All.BardRows levels={dndClassLevels}/>;
        case "Cleric": return <All.ClericRows levels={dndClassLevels}/>;
        case "Druid": return <All.DruidRows levels={dndClassLevels}/>;
        case "Fighter": return <All.FighterRows levels={dndClassLevels}/>;
        case "Monk": return <All.MonkRows levels={dndClassLevels}/>;
        case "Paladin": return <All.PaladinRows levels={dndClassLevels}/>;
        case "Ranger": return <All.RangerRows levels={dndClassLevels}/>;
        case "Rogue": return <All.RogueRows levels={dndClassLevels}/>;
        case "Sorcerer": return <All.SorcererRows levels={dndClassLevels}/>;
        case "Warlock": return <All.WarlockRows levels={dndClassLevels}/>;
        case "Wizard": return <All.WizardRows levels={dndClassLevels}/>;
        default: return <h1>Damn Dude, you broke it!</h1>;
    }}
  }

  while (dndClassLevels === null) {
  return <h1>Loading...</h1>
  }

  return (
    <DetailGrid>
      <TitleCard>
        <h1>Class Name</h1>
        <h3>Features</h3>
        <h3>Subclasses</h3>
        <h3>Extras</h3>
      </TitleCard>
      <LevelsTable>
        <TableHeader variant={dndClassLevels[0].dnd_class.name}>
          <h2>Level</h2>
          <h2>Prof Bonus</h2>
          {renderHeader()}
        </TableHeader>
        <TableGrid>
          {renderRows()}
        </TableGrid>
      </LevelsTable>
    </DetailGrid>
  )
}