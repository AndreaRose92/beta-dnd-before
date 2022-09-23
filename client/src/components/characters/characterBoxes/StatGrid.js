import React from 'react'
import { StatBox } from '../../styles/CharacterSheetGrids.style';
import { diceRoll } from '../../tools/PlayerEvents';

const StatGrid = ({stats, diceRolls, setDiceRolls}) => {

  const skillCheck = (skill, mod) => {
    let newRoll = diceRoll(skill, mod)
    if (!diceRolls[0]) {
      newRoll = {id: 1, ...newRoll}
    } else {
      newRoll = {id: (diceRolls[diceRolls.length - 1].id + 1), ...newRoll}
    }
    setDiceRolls(history => [
      ...history,
      newRoll
    ])
  }

  const renderStats = stats.map((stat) => {
    return (
      <StatBox key={stat.name}>
        <div>
          <div><p>{stat.name}</p></div>
          <div className='mid' onClick={()=>skillCheck(stat.name, stat.modifier)}>
            <h2>{stat.modifier}</h2>
          </div>
          <div className='bottom'><h4>{stat.value}</h4></div>
        </div>
      </StatBox>
    );
  });

  return (
    <React.Fragment>
      {renderStats}
    </React.Fragment>
  )
}

export default StatGrid