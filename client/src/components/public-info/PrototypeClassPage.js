import React, { useEffect, useState } from 'react'
import { getRequest } from '../tools/FetchTypes'
import { DetailGrid, LevelsTable, TableGrid, TableHeader, TitleCard } from '../styles/Details.style'
import { BarbarianHeader, BarbarianRows } from './DndClassLevelTables/BarbarianTable'
import { BardHeader, BardRows } from './DndClassLevelTables/BardTable'
import { ClericHeader, ClericRows } from './DndClassLevelTables/ClericTable'
import { DruidHeader, DruidRows } from './DndClassLevelTables/DruidTable'
import { FighterHeader, FighterRows } from './DndClassLevelTables/FighterTable'
import { MonkHeader, MonkRows } from './DndClassLevelTables/MonkTable'
import { PaladinHeader, PaladinRows } from './DndClassLevelTables/PaladinTable'
import { RangerHeader, RangerRows } from './DndClassLevelTables/RangerTable'
import { RogueHeader, RogueRows } from './DndClassLevelTables/RogueTable'
import { SorcererHeader, SorcererRows } from './DndClassLevelTables/SorcererTable'
import { WarlockHeader, WarlockRows } from './DndClassLevelTables/WarlockTable'
import { WizardHeader, WizardRows } from './DndClassLevelTables/WizardTable'
import { useParams } from 'react-router-dom'

export const PrototypeClassPage = () => {

  const params = useParams()

  const [dndClassLevels, setDndClassLevels] = useState(null)
  useEffect(()=>{getRequest(`/dnd_class_levels/${params.dnd_class}`, setDndClassLevels)},[params.dnd_class])

  const renderHeader = () => {
    if (dndClassLevels !== null) {
      switch (dndClassLevels[0].dnd_class.name) {
        case "Barbarian": return <BarbarianHeader />;
        case "Bard": return <BardHeader />;
        case "Cleric": return <ClericHeader /> ;
        case "Druid": return <DruidHeader />;
        case "Fighter": return <FighterHeader />;
        case "Monk": return <MonkHeader />;
        case "Paladin": return <PaladinHeader />;
        case "Ranger": return <RangerHeader />;
        case "Rogue": return <RogueHeader />;
        case "Sorcerer": return <SorcererHeader />;
        case "Warlock": return <WarlockHeader />;
        case "Wizard": return <WizardHeader />;
        default: return <h1>Damn Dude, you broke it!</h1>;
    }}
  }

  const renderRows = () => {
    if (dndClassLevels !== null) {
      switch (dndClassLevels[0].dnd_class.name) {
        case "Barbarian": return <BarbarianRows />;
        case "Bard": return <BardRows />;
        case "Cleric": return <ClericRows /> ;
        case "Druid": return <DruidRows />;
        case "Fighter": return <FighterRows />;
        case "Monk": return <MonkRows />;
        case "Paladin": return <PaladinRows />;
        case "Ranger": return <RangerRows />;
        case "Rogue": return <RogueRows />;
        case "Sorcerer": return <SorcererRows />;
        case "Warlock": return <WarlockRows />;
        case "Wizard": return <WizardRows />;
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
        <TableGrid variant={dndClassLevels[0].dnd_class.name}>
          {renderRows()}
        </TableGrid>
      </LevelsTable>
    </DetailGrid>
  )
}