import React, { useState } from 'react'
import { FormBox, FormGrid } from './styles'

export const StatTestSheet = () => {

    const blankStats = {strength: 0, dexterity:0, constitution: 0, intelligence: 0, wisdom: 0, charisma: 0}

    const [statOne, setStatOne] = useState(0)
    const [statTwo, setStatTwo] = useState(0)
    const [statThree, setStatThree] = useState(0)
    const [statFour, setStatFour] = useState(0)
    const [statFive, setStatFive] = useState(0)
    const [statSix, setStatSix] = useState(0)
    const [stats, setStats] = useState(blankStats)

    const statNames = ["strength", "dexterity", "constitution", "intelligence", "wisdom", "charisma"]

    const [statsLeft, setStatsLeft] = useState(statNames) 

    const renderDropDown = statsLeft.map(stat => <option key={stat} value={stat}>{stat}</option>)

  const rollNewStat = () => {
    let rolls = []
    let i = 0
    while (i <= 3) {
        rolls.push(Math.floor(Math.random() * (6-1) +1))
        ++i
    }
    let total = rolls.sort().slice(1).reduce((a,b)=> a+b)
    return total
  }

  const rollNewStatArray = e => {
    e.preventDefault()
    setStats(blankStats)
    setStatOne(rollNewStat())
    setStatTwo(rollNewStat())
    setStatThree(rollNewStat())
    setStatFour(rollNewStat())
    setStatFive(rollNewStat())
    setStatSix(rollNewStat())
  }

  const assignStat = e => {
    let statName = e.target.value
    let statNumber = e.target.name
    if (statNames.includes(statName)) {setStatsLeft(statNames.filter(stat => stat !== statName))}
    else {setStatsLeft(currentStats => currentStats.push(statName))}
    setStats({
        ...stats,
        [statName]: parseInt(statNumber)
    })
  }
  
  
    return (
    <FormGrid>
        <FormBox>
            <label htmlFor={statOne}>{statOne}
                <select name={statOne} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <label htmlFor={statTwo}>{statTwo}
                <select name={statTwo} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <label htmlFor={statThree}>{statThree}
                <select name={statThree} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <label htmlFor={statFour}>{statFour}
                <select name={statFour} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <label htmlFor={statFive}>{statFive}
                <select name={statFive} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <label htmlFor={statSix}>{statSix}
                <select name={statSix} onChange={e=>assignStat(e)}>
                    <option value='---'>---</option>
                    {renderDropDown}
                </select>
            </label>
            <button onClick={rollNewStatArray}>Roll Stat</button>
            <button onClick={e=>{e.preventDefault(); console.log(stats)}}>Stat Test</button>
            <button onClick={e=>{e.preventDefault(); console.log(statsLeft)}}>State Test</button>
        </FormBox>
    </FormGrid>
  )
}
