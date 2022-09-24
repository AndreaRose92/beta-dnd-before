import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { capitalize, NavButton } from '../tools/Hooks'

const LevelDetail = () => {

    const params = useParams()
    const [classLevel, setClassLevel] = useState({})

    useEffect(()=>{getRequest(`/dnd_class_levels/${params.dnd_class}/${params.level_id}`, setClassLevel)}, [params.dnd_class, params.level_id])

  return (
    <div>
        <h1>{capitalize(params.dnd_class)} Level {classLevel.level}</h1>
        <p>Ability Score Increase: {classLevel.ability_score_bonuses}</p>
        <p>Proficiency Bonus: {classLevel.prof_bonus}</p>
        <h3>Class Features</h3>
        <p>{classLevel.features}</p>
        <p>{classLevel.class_specific}</p>
        <NavButton path={`/${params.dnd_class}`} />
    </div>
  )
}

export default LevelDetail