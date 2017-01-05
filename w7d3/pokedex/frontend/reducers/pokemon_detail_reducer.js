import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const pokemonDetailReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.pokemon; 
    default:
      return state;
  }
};

export default pokemonDetailReducer;
