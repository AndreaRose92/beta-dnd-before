import styled from "styled-components";

export const Button = styled.button`
  display:flex;
  align-items: center;
  justify-content: center;
  height: 25px;
  width: 60px;
  border-radius: 10px;
  border: 2px ridge #d4af37;
  cursor: pointer;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);

  img {
    width: 25px;
    height: auto;
  }

  :hover {
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 100%);
  }
`

export const HealthButton = styled.button`
  display:flex;
  align-items: center;
  justify-content: center;
  height: 20px;
  width: 40px;
  border: 2px ridge #d4af37;
  cursor: pointer;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 100%);
  color: ${ (props) => props.variant === 'rust' ? '#5c0000' : '#023c19' };
  
  :hover {
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 100%);
  }
`

export const SkillButton = styled.h3`
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 80%);
  border-radius: 10px;
  box-shadow: 2px 2px;

  :hover {
    border: 2px ridge #d4af37;
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 80%);
  }

`
export const SpellButton = styled.h4`
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #aaa9ad 80%);
  border-radius: 10px;
  :hover {
    border: 2px ridge #d4af37;
    background: radial-gradient(farthest-corner at 0px 0px,
    #fff 0%, #d4af37 80%);
  }
`