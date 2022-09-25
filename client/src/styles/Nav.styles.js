import styled from "styled-components";

export const NavButton = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: gold;
    color: silver;

    .active {
        background-color: crimson;
    }
    :hover {
        background-color: crimson;
    }
`
export const Logo = styled.h1`
    margin-top: 13px;
    text-align: right;
    margin-right: 20px;
`
export const DropDown = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: gold;
    color: silver;
    text-align: center;
    max-height: fit-content;

    .active {
        background-color: crimson;
    }
    :hover {
        background-color: crimson;
    }
    :hover {
        display: block;
        >div {
            display: block;
        }
    }
`
export const DropDownContent = styled.div`
    display: none;
    max-height: fit-content;
    :hover {
        display: block;
    }
`
export const DropButton = styled(NavButton)`
    background-color: crimson;
    :hover {
        max-height: fit-content;
        background-color: gold;
        display: block;
    }
`