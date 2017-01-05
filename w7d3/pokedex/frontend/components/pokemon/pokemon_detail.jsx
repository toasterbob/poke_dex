import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    const id = this.props.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.params.pokemonId);
    }
  }

  render () {
    console.log(this.props);
    return (
      <div>

        <h1>Hello</h1>

      </div>

    );
  }

}

export default PokemonDetail;
