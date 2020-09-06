export class ResistorColor {
  private colors: string[];

  constructor(colors: string[]) {
    if (colors.length < 2) throw new Error('At least two colors need to be present')
    this.colors = colors;
  }

  value = (): number => {
    let colorValues: Array<string> = [
      'black',
      'brown',
      'red',
      'orange',
      'yellow',
      'green',
      'blue',
      'violet',
      'grey',
      'white',
    ];
    let value = '';
    this.colors.forEach((color: string) => {
      value += colorValues.indexOf(color);
    });
    return parseInt(value.slice(0, 2));
  };
}
