title 'sample gcp test section'

gcp_project_id='chef-sa'

# ::Inspec::ContentCache.cache('cache_google_project', google_project(project: gcp_project_id))

control 'gcp-2' do
  impact 0.7
  title 'Check development project'
  describe cache_google_project do
    it { should exist }
    its('name') { should eq 'chef-sa' }
    its('project_number') { should cmp 850680311855 }
    its('lifecycle_state') { should eq 'ACTIVE' }
  end
end

