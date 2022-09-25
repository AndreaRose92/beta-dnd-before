import React, { useContext, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { getRequest } from '../hookComponents/FetchTypes';
import { CharacterContext } from '../hookComponents/Hooks';
import { CharacterGrid, CharacterWrapper } from '../styles/Grids.styles';
import { ActionBox } from './characterSheetBoxes/ActionBox';
import { CombatBox } from './characterSheetBoxes/CombatBox';
import { SkillBox } from './characterSheetBoxes/SkillBox';
import { Traits } from './characterSheetBoxes/Traits';
import { SavingThrows } from './characterSheetBoxes/SavingThrows';
import { HPBox } from './characterSheetBoxes/HPBox';
import { AuxBox } from './characterSheetBoxes/AuxBox';
import StatGrid from './characterSheetBoxes/StatGrid';
import CharHeader from './characterSheetBoxes/CharHeader';
import DiceLog from './characterSheetBoxes/DiceLog';

const CharacterSheet = () => {
    const params = useParams();
    const { character, setCharacter } = useContext(CharacterContext);
    const stats = character.name !== '' ? character.stats : [{ name: '', value: 0 }];
    useEffect(() => {getRequest(`/characters/${params.id}`, setCharacter);}, [params.id, setCharacter]);

    while (character.name === '') {return (<div><h3>Loading...</h3></div>);}

    const isProficient = (string) => {return character.skills.includes(string);};

    const prof_bonus = character.name !== '' ? character.class_levels[character.level-1].prof_bonus : null;

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
            <CharHeader {...charStats}/>
            <CharacterGrid>
                <StatGrid {...charStats}/>
                <AuxBox {...charStats}/>
                <HPBox character={character} setCharacter={setCharacter}/>
                <SavingThrows {...charStats} {...calculations}/>
                <Traits {...charStats} />
                <SkillBox {...calculations}/>
                <CombatBox dex={stats[1]} />
                <ActionBox {...charStats}/>
            </CharacterGrid>
            <DiceLog/>
        </CharacterWrapper>
    );
};

export default CharacterSheet;
