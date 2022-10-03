import React, { useContext, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { CharacterGrid, CharacterWrapper } from '../styles';
import { CharacterContext, ErrorContext } from '../hookComponents';
import * as All from './characterSheetBoxes';

export const CharacterSheet = () => {
    const params = useParams();
    const { errors, setErrors } = useContext(ErrorContext)
    const { character, setCharacter } = useContext(CharacterContext);
    const stats = character.name !== '' ? character.stats : [{ name: '', value: 0 }];
    useEffect(()=>{
        fetch(`/characters/${params.id}`).then(r=>{
            if (r.ok) {
                r.json().then(character=>setCharacter(character))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    }, [params.id, setCharacter])

    while (character.name === '') {return (<div><h3>Loading...</h3></div>);}

    const isProficient = (string) => {return character.skills.includes(string);};

    const prof_bonus = character.class_levels[character.level-1].prof_bonus ? character.class_levels[character.level-1].prof_bonus : null;

    const findStat = (str) => {
        const stat = stats.find((stat) => stat.name === str);
        return stat
    };

    function skillProficiency(prof, skill) {
        let stat = findStat(skill);
        let total;
        isProficient(prof)
            ? (total = `+${parseInt(stat.modifier) + prof_bonus}`)
            : (total = stat.modifier);
        return total;
    }

    const calculations = {isProficient, skillProficiency}
    const charStats = {character, stats, prof_bonus}

    return (
        <CharacterWrapper>
            <All.CharHeader {...charStats} errors={errors}/>
            <CharacterGrid>
                <All.StatGrid {...charStats}/>
                <All.AuxBox {...charStats}/>
                <All.HPBox character={character} setCharacter={setCharacter} setErrors={setErrors}/>
                <All.SavingThrows {...charStats} {...calculations}/>
                {/* <All.Traits {...charStats} /> */}
                <All.SkillBox {...calculations}/>
                <All.CombatBox dex={stats[1]} />
                <All.ActionBox {...charStats}/>
                <All.DiceLog/>
            </CharacterGrid>
        </CharacterWrapper>
    );
};