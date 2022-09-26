import React, { useEffect, useState } from 'react'
import { DetailGrid, LevelsTable, TableGrid, TableHeader, TitleCard } from '../styles/Details.style'
import * as All from './DndClassLevelTables/'
import { useParams } from 'react-router-dom'
import { capitalize } from '../hookComponents/Hooks'

export const DndClassDetails = () => {

  const params = useParams()

  const [dndClassLevels, setDndClassLevels] = useState(null)
  const [spellLevels, setSpellLevels] = useState(null)
  
  useEffect(()=>{
    fetch(`/dnd_classes/${params.dnd_class}`)
      .then(r=>{
        if (r.ok) {
          r.json().then(data=>{setDndClassLevels(data.levels); setSpellLevels(data.spell_levels)})
        } else {
          r.json().then(errors=>console.log(errors))
        }
      })
  }, [params.dnd_class])

  const renderHeader = () => {
    if (params.dnd_class !== null) {
      switch (capitalize(params.dnd_class)) {
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
    if (params.dnd_class !== null) {
      switch (capitalize(params.dnd_class)) {
        case "Barbarian": return <All.BarbarianRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Bard": return <All.BardRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Cleric": return <All.ClericRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Druid": return <All.DruidRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Fighter": return <All.FighterRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Monk": return <All.MonkRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Paladin": return <All.PaladinRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Ranger": return <All.RangerRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Rogue": return <All.RogueRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Sorcerer": return <All.SorcererRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Warlock": return <All.WarlockRows levels={dndClassLevels} spells={spellLevels}/>;
        case "Wizard": return <All.WizardRows levels={dndClassLevels} spells={spellLevels}/>;
        default: return <h1>Damn Dude, you broke it!</h1>;
    }}
  }

  while (dndClassLevels === null) {
  return <h1>Loading...</h1>
  }

  return (
    <DetailGrid>
      <TitleCard>
        <h1>{capitalize(params.dnd_class)}</h1>
      </TitleCard>
      <LevelsTable>
        <TableHeader variant={capitalize(params.dnd_class)}>
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