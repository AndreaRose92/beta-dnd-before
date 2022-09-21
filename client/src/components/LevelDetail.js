import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from './tools/FetchTypes'
import { capitalize } from './tools/Hooks'

const LevelDetail = () => {

    const params = useParams()
    const [classLevel, setClassLevel] = useState({})

    useEffect(()=>{getRequest(`/${params.dnd_class}s/${params.level}`, setClassLevel)}, [params.dnd_class, params.level])
    // const features = classLevel.features.map(f=>{
    //         return (
    //             <li>{f.name}</li>
    //         )
    //     })

    console.log(classLevel.features)

  return (
    <div>
        <h1>{capitalize(params.dnd_class)} Level {classLevel.level}</h1>
        <p>Ability Score Increase: {classLevel.ability_score_bonuses}</p>
        <p>Proficiency Bonus: {classLevel.prof_bonus}</p>
        <h3>Class Features</h3>
        <p>{classLevel.features}</p>
        <p>{classLevel.class_specific}</p>
    </div>
  )
}

export default LevelDetail