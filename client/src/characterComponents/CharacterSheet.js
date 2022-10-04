import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { CharacterGrid, CharacterWrapper } from '../styles';
// import { CharacterContext, ErrorContext } from '../hookComponents';
import * as All from './characterSheetBoxes';

export const CharacterSheet = () => {
    const params = useParams();
    const [character, setCharacter] = useState(null)

    useEffect(()=>{
        fetch(`/characters/${params.id}`).then(r=>{
            if (r.ok) {
                r.json().then(data=>setCharacter(data))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    },[params.id])

    while (character === null) {return (<div><h3>Loading...</h3></div>);}



    return (
        <CharacterWrapper>
            <All.CharHeader {...character}/>
            <CharacterGrid>
                <All.StatGrid stats={character.stats}/>
                <All.AuxBox {...character}/>
                <All.HPBox {...character} setCharacter={setCharacter}/>
                <All.SavingThrows {...character}/>
                <All.Traits {...character}/>
                <All.SkillBox {...character}/>
                <All.CombatBox dex={character.stats[1]}/>
                <All.ActionBox {...character}/>
                <All.DiceLog/>
            </CharacterGrid>
        </CharacterWrapper>
    );
};