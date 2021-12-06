import matlab.unittest.TestRunner;
import matlab.unittest.Verbosity;
import matlab.unittest.plugins.XMLPlugin;

addpath(genpath('src'));

suite = testsuite(pwd, 'IncludeSubfolders', true);

[~,~] = mkdir('matlabTestArtifacts');

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed );
runner.addPlugin(XMLPlugin.producingJUnitFormat('matlabTestArtifacts/junittestresults.xml'));

results = runner.run(suite);

nfailed = nnz([results.Failed]);
assert(nfailed == 0, [num2str(nfailed) ' test(s) failed.']);