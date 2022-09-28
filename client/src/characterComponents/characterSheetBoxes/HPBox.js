import { useState } from "react";
import { HealthButton, HealthBox, HealthInput } from "../../styles";

export const HPBox = ({ character, setCharacter }) => {
    const [newHP, setNewHP] = useState(0);
    const handleHP = (e) => {
      e.preventDefault();
      let updatedHP;
      if (e.target.name === 'heal') {
        updatedHP = parseInt(character.current_hp) + parseInt(newHP);
      } else if (e.target.name === 'damage') {
        updatedHP = parseInt(character.current_hp) - parseInt(newHP);
      }
      fetch(`/characters/${character.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          current_hp: updatedHP,
        }),
      }).then((r) => {
        if (r.ok) {
          r.json().then((update) => setCharacter(update));
        } else {
          r.json().then((errors) => console.log(errors));
        }
      });
    };
  
    return (
      <HealthBox>
        <div className='heal-buttons'>
          <HealthButton name='heal' onClick={handleHP}>Heal</HealthButton>
          <HealthInput
            value={newHP}
            onChange={(e) => setNewHP(e.target.value)}
            className='mid'
            type='number'
          />
          <HealthButton variant='rust' name='damage' onClick={handleHP}>Damage</HealthButton>
        </div>
        <div>
          <div><p>CURRENT</p></div>
          <div className='mid'><h2>{character.current_hp}</h2></div>
        </div>
        <div>
          <div><p>MAXIMUM</p></div>
          <div className='mid'><h2>{character.hp}</h2></div>
          <div className='bottom'><h4>{'HEALTH & STATUS'}</h4></div>
        </div>
        <div>
          <div><p>TEMPORARY</p></div>
          <div className='mid'><h2>{'--'}</h2></div>
        </div>
      </HealthBox>
    );
  };