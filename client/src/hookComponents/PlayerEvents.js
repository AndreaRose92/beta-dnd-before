import React, { createContext, useState } from "react";
import { FullCaster, HalfCaster } from "./Hooks";

export const DiceContext = createContext();

export const DiceProvider = ({ children }) => {
  const [diceHistory, setDiceHistory] = useState([]);
  return (
    <DiceContext.Provider value={{ diceHistory, setDiceHistory }}>
      {children}
    </DiceContext.Provider>
  );
};

export const diceRoll = (name = "", modifier = "", dSize = 20, amt = 1) => {
  let total = 0;
  let rolls = [];
  for (let i = 0; i < amt; i++) {
    rolls.push(Math.floor(Math.random() * (dSize - 1) + 1));
  }
  total = rolls.reduce((a, b) => a + b, total) + parseInt(modifier);
  const result = {
    name: name,
    modifier: modifier,
    total: total,
    dSize: dSize,
    amt: amt,
    rolls: rolls,
  };
  return result;
};

export const DetailContext = createContext();

export const DetailProvider = ({ children }) => {
  const [details, setDetails] = useState(null);
  return (
    <DetailContext.Provider value={{ details, setDetails }}>
      {children}
    </DetailContext.Provider>
  );
};

export const ClassHeaderVariants = (name) => {
  switch (name) {
    case "Barbarian":
      return (
        <React.Fragment>
          <h2>Rage Count</h2>
          <h2>Damage Bonus</h2>
        </React.Fragment>
      );
    case "Bard":
      return (
        <React.Fragment>
          <h2>Bardic Insp.</h2>
          <h2>Song of Rest</h2>
          <h2>Cantrips Known</h2>
          <h2>Spells Known</h2>
          <FullCaster variant={"Bard"} />
        </React.Fragment>
      );
    case "Cleric":
      return (
        <React.Fragment>
          <h2>Cantrips Known</h2>
          <FullCaster variant={"Cleric"} />
        </React.Fragment>
      );
    case "Druid":
      return (
        <React.Fragment>
          <h2>Cantrips Known</h2>
          <FullCaster variant={"Druid"} />
        </React.Fragment>
      );
    case "Fighter":
      return (
        <React.Fragment>
          <h2>Action Surges</h2>
          <h2>Extra Attacks</h2>
          <h2>Indomitable Uses</h2>
        </React.Fragment>
      );
    case "Monk":
      return (
        <React.Fragment>
          <h2>Martial Arts</h2>
		  <h2>Ki Points</h2>
          <h2>Unarmored Movement</h2>
        </React.Fragment>
      );
    case "Paladin":
      return <HalfCaster variant={"Paladin"} />;
    case "Ranger":
      return (
        <React.Fragment>
          <h2>Spells Known</h2>
          <HalfCaster variant={"Ranger"} />
        </React.Fragment>
      );
    case "Rogue":
      return (
        <React.Fragment>
          <h2>Sneak Attack</h2>
        </React.Fragment>
      );
    case "Sorcerer":
      return (
        <React.Fragment>
          <h2>Sorcerery Points</h2>
          <h2>Metamagic Known</h2>
          <h2>Cantrips Known</h2>
          <h2>Spells Known</h2>
          <FullCaster variant={"Sorcerer"} />
        </React.Fragment>
      );
    case "Warlock":
      return (
        <React.Fragment>
          <h2>Cantrips Known</h2>
          <h2>Spells Known</h2>
          <h2>Spell Slots</h2>
          <h2>Slot Level</h2>
          <h2>Invocations Known</h2>
        </React.Fragment>
      );
    case "Wizard":
      return (
        <React.Fragment>
          <h2>Cantrips Known</h2>
          <FullCaster variant={"Wizard"} />
        </React.Fragment>
      );
    default:
      return null;
  }
};

export const ClassDetailVariants = (level, name) => {
  switch (name) {
    case "Barbarian":
      return barbarianRow(level);
    case "Bard":
      return bardRow(level);
    case "Cleric":
      return clericRow(level);
    case "Druid":
      return druidRow(level);
    case "Fighter":
      return fighterRow(level);
    case "Monk":
      return monkRow(level);
    case "Paladin":
      return paladinRow(level);
    case "Ranger":
      return rangerRow(level);
    case "Rogue":
      return rogueRow(level);
    case "Sorcerer":
      return sorcererRow(level);
    case "Warlock":
      return warlockRow(level);
    case "Wizard":
      return wizardRow(level);
    default:
      return null;
  }
};

const casterRow = (level) => {
  return (
    <React.Fragment>
      <h4>{level.lvl_1_spell_slots}</h4>
      <h4>{level.lvl_2_spell_slots !== 0 ? level.lvl_2_spell_slots : "-"}</h4>
      <h4>{level.lvl_3_spell_slots !== 0 ? level.lvl_3_spell_slots : "-"}</h4>
      <h4>{level.lvl_4_spell_slots !== 0 ? level.lvl_4_spell_slots : "-"}</h4>
      <h4>{level.lvl_5_spell_slots !== 0 ? level.lvl_5_spell_slots : "-"}</h4>
      <h4>{level.lvl_6_spell_slots !== 0 ? level.lvl_6_spell_slots : "-"}</h4>
      <h4>{level.lvl_7_spell_slots !== 0 ? level.lvl_7_spell_slots : "-"}</h4>
      <h4>{level.lvl_8_spell_slots !== 0 ? level.lvl_8_spell_slots : "-"}</h4>
      <h4>{level.lvl_9_spell_slots !== 0 ? level.lvl_9_spell_slots : "-"}</h4>
    </React.Fragment>
  );
};

const barbarianRow = (level) => {
  return (
    <React.Fragment>
      <h2>{level.rage_count}</h2>
      <h2>{level.rage_damage_bonus}</h2>
    </React.Fragment>
  );
};

const bardRow = (level) => {
  return (
    <React.Fragment>
      <h2>{level.bardic_inspiration_die}</h2>
      <h2>{level.song_of_rest_die}</h2>
      <h2>{level.cantrips_known}</h2>
      <h2>{level.spells_known}</h2>
      {casterRow(level)}
    </React.Fragment>
  );
};

const clericRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.cantrips_known}</h2>
		{casterRow(level)}
	</React.Fragment>
);
};

const druidRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.cantrips_known}</h2>
		{casterRow(level)}
	</React.Fragment>
	);
};

const fighterRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.action_surges}</h2>
		<h2>{level.extra_attacks}</h2>
		<h2>{level.indomitable_uses}</h2>
	</React.Fragment>
	);
};

const monkRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.martial_arts_dice_count}d{level.martial_arts_dice_value}</h2>
		<h2>{level.ki_points}</h2>
		<h2>{level.unarmored_movement}ft</h2>
	</React.Fragment>
	);
};

const paladinRow = (level) => {
  return (
  	<React.Fragment>
		{casterRow(level)}
	</React.Fragment>
	);
};

const rangerRow = (level) => {
	return (
		<React.Fragment>
		<h2>{level.spells_known}</h2>
		  {casterRow(level)}
	</React.Fragment>
	);
};

const rogueRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.sneak_attack_dice_amount}d{level.sneak_attack_dice_value}</h2>
	</React.Fragment>
	);
};

const sorcererRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.sorcerery_points}</h2>
		<h2>{level.metamagic_known}</h2>
		<h2>{level.cantrips_known}</h2>
		<h2>{level.spells_known}</h2>
		{casterRow(level)}
	</React.Fragment>
	);
};

const warlockRow = (level) => {
  return (
  	<React.Fragment>
		<h2>{level.cantrips_known}</h2>
		<h2>{level.spells_known}</h2>
		<h2>{level.warlock_slots}</h2>
		<h2>{level.warlock_slot_level}</h2>
		<h2>{level.invocations_known}</h2>
	</React.Fragment>
	);
};

const wizardRow = (level) => {
  return (
    <React.Fragment>
      <h2>{level.cantrips_known}</h2>
      {casterRow(level)}
    </React.Fragment>
  );
};
