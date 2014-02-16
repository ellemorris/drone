#print "hello world"
import sys
sys.path.append("//anaconda/lib/python2.7/site-packages")
print sys.path

import matplotlib.pyplot as plt
from datetime import datetime
import pytz

from zipline.algorithm import TradingAlgorithm
from zipline.utils.factory import load_from_yahoo
from zipline.finance import risk  
from zipline.finance import trading  
from zipline.utils.factory import create_returns_from_list 
import pandas as pd
import numpy as np

class BuyApple(TradingAlgorithm):  # inherit from TradingAlgorithm
    """This is the simplest possible algorithm that does nothing but
    buy 1 apple share on each event.
    """
    def handle_data(self, data):  # overload handle_data() method
        self.order('AAPL', 1)
        self.order('MSFT', 1)  # order SID (=0) and amount (=1 shares)


if __name__ == '__main__':
    start = datetime(2008, 1, 1, 0, 0, 0, 0, pytz.utc)
    end = datetime(2010, 1, 1, 0, 0, 0, 0, pytz.utc)
    data = load_from_yahoo(stocks=['AAPL', 'MSFT'], indexes={}, start=start,
                           end=end)
    simple_algo = BuyApple()
    results = simple_algo.run(data)
    #print results.__class__
    #print dir(results)
    #print dir(simple_algo)
    results.portfolio_value.to_csv("fdata/test.csv")
    results.pnl.to_csv("fdata/pnl.csv")
    results.ending_cash.to_csv("fdata/cash.csv")
    #print results.positions[1]
    #print "done"
    #print dir(simple_algo.perf_tracker)
    #ret_df = pd.DataFrame(simple_algo.perf_tracker.cumulative_risk_metrics.benchmark_returns)
    #ret_df = pd.DataFrame(simple_algo.perf_tracker.cumulative_risk_metrics.benchmark_returns, index=None)
    #ret_df.reset_index(level=0, drop=True)
    
    #ret_df2 = pd.DataFrame(results['returns'], index=None)
    #ret_df2.reset_index(level=0, drop=True)    

    x = np.array(results['returns'])
    x2 = np.array(simple_algo.perf_tracker.cumulative_risk_metrics.benchmark_returns)
    ret_df = pd.DataFrame(x, columns=['rets'])
    ret_df['benchmark'] = x2
    #print ret_df
    ret_df.to_csv("fdata/test2.csv")
    #print pd.concat([ret_df, ret_df2])
    #print results['returns'].__class__
    #print simple_algo.perf_tracker.cumulative_risk_metrics.benchmark_returns
    #print pd.concat([results['returns'], simple_algo.perf_tracker.cumulative_risk_metrics.benchmark_returns], drop=True)
    #print simple_algo.perf_tracker.cumulative_risk_metrics.to_dict()
    #print results
    #x = simple_algo.perf_tracker.cumulative_risk_metrics.to_dict()
    import csv

    x =  simple_algo.perf_tracker.risk_report.to_dict()
    
    one_month = x['one_month']
    fieldnames = one_month[0].keys()
    test_file = open('fdata/one_month.csv','wb')
    csvwriter = csv.DictWriter(test_file, delimiter=',', fieldnames=fieldnames)
    csvwriter.writerow(dict((fn,fn) for fn in fieldnames))
    for row in one_month:
        csvwriter.writerow(row)
    test_file.close()

    one_month = x['six_month']
    fieldnames = one_month[0].keys()
    test_file = open('fdata/six_month.csv','wb')
    csvwriter = csv.DictWriter(test_file, delimiter=',', fieldnames=fieldnames)
    csvwriter.writerow(dict((fn,fn) for fn in fieldnames))
    for row in one_month:
        csvwriter.writerow(row)
    test_file.close()

    one_month = x['twelve_month']
    fieldnames = one_month[0].keys()
    test_file = open('fdata/twelve_month.csv','wb')
    csvwriter = csv.DictWriter(test_file, delimiter=',', fieldnames=fieldnames)
    csvwriter.writerow(dict((fn,fn) for fn in fieldnames))
    for row in one_month:
        csvwriter.writerow(row)
    test_file.close()

    #print simple_algo.perf_tracker.cumulative_risk_metrics.to_dict()
    #x =  simple_algo.perf_tracker.risk_report.to_dict()
    #print x['one_month']
    #print len(x['one_month'])
    #print x[1]
    #print len(x)
    #print results.head()