import React from 'react';


class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemons = this.props.pokemon.map(pokemon =>
      <li key={pokemon.id}>
        {pokemon.name}
        <br />
        <img className="small" height='75' src={pokemon.image_url} />
      </li>
    );

    return(
      <div>
        <ul className="pokemon-list">
          { pokemons }
        </ul>
      </div>
    );

  }
}



export default PokemonIndex;
