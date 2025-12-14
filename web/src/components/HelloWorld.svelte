<script lang="ts">
  import { visibility, jobs, licenses, playerLicenses } from '../store/stores';
  import { fetchNui } from '../utils/fetchNui';
  
  let pages = ['Get Jobs', 'Buy Licenses',];
  
  let page = 'Get Jobs';
  $jobs = $jobs.sort((a, b) => a.label.localeCompare(b.label));
  $licenses = $licenses.sort((a, b) => a.label.localeCompare(b.label));

  const closeDialog = () => {
    visibility.set(false);
    fetchNui('hideUI');
  };
  
  function selectPage(selectedPage: string) {
    page = selectedPage;
  }
  
  async function buyLicense(license: any) {
    await fetchNui('buyLicense', license);
  }
  
  async function selectJob(job: any) {
    await fetchNui('selectJob', job);
  }
</script>

<div class="container">
  <div class="header">
    <span class="title">City Hall</span>
    <button class="close-button" on:click={closeDialog}>✕</button>
  </div>
  
  <div class="nav-tabs">
    {#each pages as tabPage}
      <button 
        class="tab" 
        class:active={page === tabPage}
        on:click={() => selectPage(tabPage)}
      >
        {tabPage}
      </button>
    {/each}
  </div>
  
  <div class="content">
    {#if page === 'Buy Licenses'}
      <div class="grid">
        {#each $licenses as license}
          {#if $playerLicenses.includes(license.license) || license.name === 'id_card'}
            <div class="card" on:click={() => buyLicense(license.name)}>
              <div class="card-header">
                <span class="card-title">{license.label}</span>
              </div>
              <div class="card-body">
                <span class="price">${license.price}</span>
              </div>
            </div>
          {/if}
        {/each}
        {#if !$playerLicenses.includes('driver')}
          <div class="card" on:click={() => buyLicense('drivers_license')}>
              <div class="card-header">
                <span class="card-title">Get Drivers License</span>
              </div>
              <div class="card-body">
                <span class="price">$100</span>
              </div>
            </div>
        {/if}
      </div>
    {:else if page === 'Get Jobs'}
      <div class="grid">
        {#each $jobs as job}
          <div class="card job-card" on:click={() => selectJob(job.name)}>
            <div class="job-image-container">
              <img src={job.image} alt={job.label} class="job-image" />
            </div>
            <div class="card-header">
              <span class="card-title">{job.label}</span>
            </div>
            <div class="card-body">
              <span class="description">{job.description}</span>
            </div>
          </div>
        {/each}
      </div>
    {/if}
  </div>
</div>

<style>
  .container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    border-radius: 25px;
    width: 60%;
    height: 83%;
    color: #e0e0e0;
    background-color: #1a1a1a;
    display: flex;
    flex-direction: column;
    overflow: hidden;
  }
  
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1.5rem 2rem;
    background-color: #0f0f0f;
    border-bottom: 1px solid #2a2a2a;
  }
  
  .title {
    font-size: 1.5rem;
    font-weight: 600;
    letter-spacing: -0.02em;
  }
  
  .close-button {
    background: none;
    border: none;
    color: #ac0303;
    font-size: 1.5rem;
    cursor: pointer;
    padding: 0;
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: color 0.2s;
  }
  
  .close-button:hover {
    color: #d10101;
  }
  
  .nav-tabs {
    display: flex;
    gap: 0;
    background-color: #0f0f0f;
    border-bottom: 1px solid #2a2a2a;
    padding: 0 2rem;
  }
  
  .tab {
    background: none;
    border: none;
    color: #808080;
    padding: 1rem 1.5rem;
    cursor: pointer;
    font-size: 0.95rem;
    font-weight: 500;
    transition: all 0.2s;
    border-bottom: 2px solid transparent;
  }
  
  .tab:hover {
    color: #b0b0b0;
  }
  
  .tab.active {
    color: #ffffff;
    border-bottom-color: #ffffff;
  }
  
  .content {
    flex: 1;
    padding: 2rem;
    overflow-y: auto;
  }
  
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 1rem;
  }
  
  .card {
    background-color: #242424;
    border: 1px solid #2a2a2a;
    border-radius: 6px;
    padding: 1.5rem;
    cursor: pointer;
    transition: all 0.2s;
  }
  
  .job-card {
    padding: 0;
    overflow: hidden;
  }
  
  .job-image-container {
    width: 100%;
    height: 160px;
    background-color: #1a1a1a;
    overflow: hidden;
  }
  
  .job-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .job-card .card-header {
    padding: 1rem 1.5rem 0.5rem 1.5rem;
  }
  
  .job-card .card-body {
    padding: 0 1.5rem 1.5rem 1.5rem;
  }
  
  .card:hover {
    background-color: #2a2a2a;
    border-color: #404040;
  }
  
  .card-header {
    margin-bottom: 1rem;
  }
  
  .card-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #ffffff;
  }
  
  .card-body {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .price {
    font-size: 1.5rem;
    font-weight: 700;
    color: #e0e0e0;
  }
  
  .description {
    font-size: 0.9rem;
    color: #a0a0a0;
    line-height: 1.4;
  }
  
  .info-section {
    max-width: 600px;
    margin: 0 auto;
  }
  
  .info-section h2 {
    font-size: 1.8rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: #ffffff;
  }
  
  .info-section p {
    font-size: 1rem;
    color: #a0a0a0;
    line-height: 1.6;
    margin-bottom: 2rem;
  }
  
  .action-button {
    background-color: #2a2a2a;
    border: 1px solid #404040;
    color: #ffffff;
    padding: 0.875rem 1.75rem;
    border-radius: 6px;
    font-size: 1rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
  }
  
  .action-button:hover {
    background-color: #333333;
    border-color: #4a4a4a;
  }
  
  .content::-webkit-scrollbar {
    display:none;
  }
  
</style>