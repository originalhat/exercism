import RunLengthEncoding from './run-length-encoding'

describe('run-length encode a string', () => {
  it('empty string', () => {
    const expected = '';
    expect(RunLengthEncoding.encode('')).toEqual(expected)
  });

  it('single characters only are encoded without count', () => {
    const expected = 'XYZ';
    expect(RunLengthEncoding.encode('XYZ')).toEqual(expected)
  });

  it('string with no single characters', () => {
    const expected = '2A3B4C';
    expect(RunLengthEncoding.encode('AABBBCCCC')).toEqual(expected)
  });

  xit('single characters mixed with repeated characters', () => {
    const expected = '12WB12W3B24WB';
    expect(RunLengthEncoding.encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')).toEqual(expected)
  });

  xit('multiple whitespace mixed in string', () => {
    const expected = '2 hs2q q2w2 ';
    expect(RunLengthEncoding.encode('  hsqq qww  ')).toEqual(expected)
  });

  xit('lowercase characters', () => {
    const expected = '2a3b4c';
    expect(RunLengthEncoding.encode('aabbbcccc')).toEqual(expected)
  })
});

describe('run-length decode a string', () => {
  xit('empty string', () => {
    const expected = '';
    expect(RunLengthEncoding.decode('')).toEqual(expected)
  });

  xit('single characters only', () => {
    const expected = 'XYZ';
    expect(RunLengthEncoding.decode('XYZ')).toEqual(expected)
  });

  xit('string with no single characters', () => {
    const expected = 'AABBBCCCC';
    expect(RunLengthEncoding.decode('2A3B4C')).toEqual(expected)
  });

  xit('single characters with repeated characters', () => {
    const expected = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB';
    expect(RunLengthEncoding.decode('12WB12W3B24WB')).toEqual(expected)
  });

  xit('multiple whitespace mixed in string', () => {
    const expected = '  hsqq qww  ';
    expect(RunLengthEncoding.decode('2 hs2q q2w2 ')).toEqual(expected)
  });

  xit('lower case string', () => {
    const expected = 'aabbbcccc';
    expect(RunLengthEncoding.decode('2a3b4c')).toEqual(expected)
  })
});

describe('encode and then decode', () => {
  xit('encode followed by decode gives original string', () => {
    expect(RunLengthEncoding.decode(RunLengthEncoding.encode('zzz ZZ  zZ'))).toEqual('zzz ZZ  zZ')
  })
});
