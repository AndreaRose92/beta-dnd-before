import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getRequest } from "../tools/FetchTypes"
import { NavButton, capitalize } from "../tools/Hooks"

export const RaceDetail = () => {

    const params = useParams()
    const [race, setRace] = useState({
        name: '',
        speed: 0,
        size: '',
        traits: '',
        languages: '',
        proficiencies: []
    })

    useEffect(()=>{getRequest(`/races/${params.race}`, setRace)}, [params.race])

    // const proficiencies = race ? race.proficiencies : null

    while (race.name === '') {
        return <div>Loading...</div>
    }

    return (
        <div>
            <h2>{capitalize(race.name)}</h2>
            <ul>
                <li>ABI: {race.ability_score_bonuses}</li>
                <li>Speed: {race.speed}ft</li>
                <li>Size: {race.size}</li>
                <li>Traits: {race.traits}</li>
                <li>Languages: {race.languages}</li>
                {/* {proficiencies ? <li>Proficiences: {proficiencies.map(p =>p.name)}</li> : null} */}
            </ul>
            <NavButton path="/races"/>
        </div>
    )

}